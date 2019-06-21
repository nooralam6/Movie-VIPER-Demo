//
//  MovieDetailPresenter.swift
//  Project: MovieVIPERDemo
//
//  Module: MovieDetail
//
//  By new 19/06/19
//  Sunday Mobility 2019
//

// MARK: Imports

import UIKit

import SwiftyVIPER

// MARK: Protocols

/// Should be conformed to by the `MovieDetailPresenter` and referenced by `MovieDetailViewController`
protocol MovieDetailViewPresenterProtocol: ViewPresenterProtocol {
    func getMovieDetail(imdbID: String)
}

/// Should be conformed to by the `MovieDetailPresenter` and referenced by `MovieDetailInteractor`
protocol MovieDetailInteractorPresenterProtocol: class {
	/** Sets the title for the presenter
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
    func movieDetailFetched(data: MovieDetailData)
    func errorFetchingMovieDetail()
    
}

// MARK: -

/// The Presenter for the MovieDetail module
final class MovieDetailPresenter: MovieDetailViewPresenterProtocol, MovieDetailInteractorPresenterProtocol {
    
    
	// MARK: - Constants

	let router: MovieDetailPresenterRouterProtocol
	let interactor: MovieDetailPresenterInteractorProtocol

	// MARK: Variables

	weak var view: MovieDetailPresenterViewProtocol?

	// MARK: Inits

	init(router: MovieDetailPresenterRouterProtocol, interactor: MovieDetailPresenterInteractorProtocol) {
		self.router = router
		self.interactor = interactor
	}

	// MARK: - MovieDetail View to Presenter Protocol

	func viewLoaded() {
		interactor.requestTitle()
	}

	// MARK: - MovieDetail Interactor to Presenter Protocol

	func set(title: String?) {
		view?.set(title: title)
	}
    
    func getMovieDetail(imdbID: String) {
        view?.showLoader()
        interactor.getMovieDetail(imdbID: imdbID)
    }
    
    func movieDetailFetched(data: MovieDetailData) {
        view?.removeLoader()
        view?.set(title: data.title)
        view?.setMovieDetail(data: data)
    }
    
    func errorFetchingMovieDetail() {
        view?.removeLoader()
    }
}
