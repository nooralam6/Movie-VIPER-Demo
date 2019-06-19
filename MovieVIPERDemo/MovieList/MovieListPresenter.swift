//
//  MovieListPresenter.swift
//  Project: MovieVIPERDemo
//
//  Module: MovieList
//
//  By new 19/06/19
//  Sunday Mobility 2019
//

// MARK: Imports

import UIKit

import SwiftyVIPER
import RealmSwift
// MARK: Protocols

/// Should be conformed to by the `MovieListPresenter` and referenced by `MovieListViewController`
protocol MovieListViewPresenterProtocol: ViewPresenterProtocol {
    func getMoreMovies()
    func didSelect(movie: MovieData)
}

/// Should be conformed to by the `MovieListPresenter` and referenced by `MovieListInteractor`
protocol MovieListInteractorPresenterProtocol: class {
	/** Sets the title for the presenter
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
    func movieListFetched(movieList: List<MovieData>)
    func errorOnFetchingList(title: String, message: String)
}

// MARK: -

/// The Presenter for the MovieList module
final class MovieListPresenter: MovieListViewPresenterProtocol, MovieListInteractorPresenterProtocol {
    
    
    var page = 1
    
	// MARK: - Constants

	let router: MovieListPresenterRouterProtocol
	let interactor: MovieListPresenterInteractorProtocol

	// MARK: Variables

	weak var view: MovieListPresenterViewProtocol?

	// MARK: Inits

	init(router: MovieListPresenterRouterProtocol, interactor: MovieListPresenterInteractorProtocol) {
		self.router = router
		self.interactor = interactor
	}

	// MARK: - MovieList View to Presenter Protocol

	func viewLoaded() {
        view?.showLoader()
		interactor.requestTitle()
        
        if NetworkStatus.shared.isPresent() {
            interactor.getMovieList(page: self.page)
        } else {
            SwiftMessage.shared.showNoInternetMessage()
            interactor.getOfflineData()
        }
	}

	// MARK: - MovieList Interactor to Presenter Protocol

	func set(title: String?) {
		view?.set(title: title)
	}
    
    func getMoreMovies() {
        page += 1
        interactor.getMovieList(page: page)
    }
    
    //MARK:- MovieList Presenter to Router
    func didSelect(movie: MovieData) {
        router.openMovieDetail(movieData: movie)
    }
    
    
    func movieListFetched(movieList: List<MovieData>) {
        view?.removeLoader()
        if movieList.isEmpty && page == 1{
            view?.addEmptyView(action: {
                print("Retry")
            })
        } else {
            view?.setData(list: movieList)
            view?.removeEmptyView()
        }
        
    }
    
    func errorOnFetchingList(title: String, message: String) {
        SwiftMessage.shared.showMesaage(of: .warning, withTitle: title, andMessage: message)
    }
    
}
