//
//  MovieDetailInteractor.swift
//  Project: MovieVIPERDemo
//
//  Module: MovieDetail
//
//  By new 19/06/19
//  Sunday Mobility 2019
//

// MARK: Imports

import Foundation
import SwiftyVIPER

// MARK: Protocols

/// Should be conformed to by the `MovieDetailInteractor` and referenced by `MovieDetailPresenter`
protocol MovieDetailPresenterInteractorProtocol {
	/// Requests the title for the presenter
	func requestTitle()
    func getMovieDetail(imdbID: String)
}

// MARK: -

/// The Interactor for the MovieDetail module
final class MovieDetailInteractor: MovieDetailPresenterInteractorProtocol {
    
    

	// MARK: - Variables

	weak var presenter: MovieDetailInteractorPresenterProtocol?

	// MARK: - MovieDetail Presenter to Interactor Protocol

	func requestTitle() {
		presenter?.set(title: "MovieDetail")
	}
    
    func getMovieDetail(imdbID: String) {
        APIService.shared.request(api: "", type: .get, parameters: ["i" : imdbID], completion: { (response) in
            DLog(message: response)
            do {
                let resp = try decoder.decode(MovieDetailData.self, from: response as! Data)
                if resp.response == "True" {
                    self.presenter?.movieDetailFetched(data: resp)
                } else {
                    self.presenter?.errorFetchingMovieDetail()
                }
            } catch {
                DLog(message: error)
                self.presenter?.errorFetchingMovieDetail()
            }
        }) { (error) in
            self.presenter?.errorFetchingMovieDetail()
            DLog(message: error)
        }
    }
}
