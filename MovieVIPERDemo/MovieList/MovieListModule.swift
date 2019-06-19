//
//  MovieListModule.swift
//  Project: MovieVIPERDemo
//
//  Module: MovieList
//
//  By new 19/06/19
//  Sunday Mobility 2019
//

// MARK: Imports

import SwiftyVIPER
import UIKit

// MARK: -

/// Used to initialize the MovieList VIPER module
final class MovieListModule: ModuleProtocol {

	// MARK: - Constants

	let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)

	// MARK: Variables

	private(set) lazy var interactor: MovieListInteractor = {
		MovieListInteractor()
	}()

	private(set) lazy var router: MovieListRouter = {
		MovieListRouter()
	}()

	private(set) lazy var presenter: MovieListPresenter = {
		MovieListPresenter(router: self.router, interactor: self.interactor)
	}()

	private(set) lazy var view: MovieListViewController = {
		var vc = self.storyboard.viewController(MovieListViewController.self)
		vc.presenter = self.presenter
		return vc
	}()

	// MARK: - Module Protocol Variables

	var viewController: UIViewController {
		return view
	}

	// MARK: Inits

	init() {
		presenter.view = view
		router.viewController = view
		interactor.presenter = presenter
	}
}
