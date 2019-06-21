//
//  MovieListInteractor.swift
//  Project: MovieVIPERDemo
//
//  Module: MovieList
//
//  By new 19/06/19
//  Sunday Mobility 2019
//

// MARK: Imports

import Foundation
import SwiftyVIPER
import RealmSwift

// MARK: Protocols

/// Should be conformed to by the `MovieListInteractor` and referenced by `MovieListPresenter`
protocol MovieListPresenterInteractorProtocol {
	/// Requests the title for the presenter
	func requestTitle()
    func getMovieList(page: Int, search: String)
    func getOfflineData()
}

// MARK: -

/// The Interactor for the MovieList module
final class MovieListInteractor: MovieListPresenterInteractorProtocol {
	// MARK: - Variables

	weak var presenter: MovieListInteractorPresenterProtocol?

	// MARK: - MovieList Presenter to Interactor Protocol

	func requestTitle() {
		presenter?.set(title: "Movie List")
	}
    
    func getMovieList(page: Int, search: String) {
        APIService.shared.request(api: "", type: .get, parameters: ["s": search, "page": page], completion: { (response) in
            do {
                let resp = try decoder.decode(MovieListBase.self, from: response as! Data)
                if resp.response == "False" {
                    self.presenter?.errorOnFetchingList(title: "That's It!", message: resp.error ?? "You have reached end of the list.")
                } else {
                    self.saveToRealm(list: resp.list)
                    self.presenter?.movieListFetched(movieList: resp.list)
                }
            } catch {
                self.presenter?.errorOnFetchingList(title: "", message: error.localizedDescription)
            }
            DLog(message: response)
        }) { (err) in
            DLog(message: err)
            self.presenter?.errorOnFetchingList(title: "", message: "")
        }
    }
    
    func getOfflineData() {
        self.presenter?.movieListFetched(movieList: RealmDB.shared.retreiveFromRealm(objType: MovieData()))
    }
    
    func errorOnFetchingList() {
        
    }
    
    func saveToRealm(list: List<MovieData>) {
        RealmDB.shared.saveToRealmList(obj: list, append: true)
    }
}
