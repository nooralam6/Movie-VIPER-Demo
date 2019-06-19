//
//  MovieListRouter.swift
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

// MARK: Protocols

/// Should be conformed to by the `MovieListRouter` and referenced by `MovieListPresenter`
protocol MovieListPresenterRouterProtocol: PresenterRouterProtocol {
    func openMovieDetail(movieData: MovieData)
}

// MARK: -

/// The Router for the MovieList module
final class MovieListRouter: RouterProtocol, MovieListPresenterRouterProtocol {
    
    

	// MARK: - Variables

	weak var viewController: UIViewController?
    
    func openMovieDetail(movieData: MovieData) {
        MovieDetailModule(movieData: movieData).push(from: viewController?.navigationController)
    }
    
}
