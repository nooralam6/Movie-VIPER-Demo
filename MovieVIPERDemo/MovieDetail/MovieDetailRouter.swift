//
//  MovieDetailRouter.swift
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

/// Should be conformed to by the `MovieDetailRouter` and referenced by `MovieDetailPresenter`
protocol MovieDetailPresenterRouterProtocol: PresenterRouterProtocol {

}

// MARK: -

/// The Router for the MovieDetail module
final class MovieDetailRouter: RouterProtocol, MovieDetailPresenterRouterProtocol {

	// MARK: - Variables

	weak var viewController: UIViewController?
}
