//
//  MovieListViewController.swift
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

/// Should be conformed to by the `MovieListViewController` and referenced by `MovieListPresenter`
protocol MovieListPresenterViewProtocol: class {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
    func showLoader()
    func removeLoader()
    func setData(list: List<MovieData>)
    func addEmptyView(action: @escaping()->())
    func removeEmptyView()
}

// MARK: -

/// The View Controller for the MovieList module
class MovieListViewController: UIViewController, StoryboardIdentifiable, MovieListPresenterViewProtocol {
    
	// MARK: - Constants
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
	var presenter: MovieListViewPresenterProtocol?
    var movieList = List<MovieData>()
    
	// MARK: - Load Functions

	override func viewDidLoad() {
    	super.viewDidLoad()
		presenter?.viewLoaded()
        tableView.register(UINib(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
		view.backgroundColor = .white
    }

	// MARK: - MovieList Presenter to View Protocol

	func set(title: String?) {
		self.title = title
	}
    
    func setData(list: List<MovieData>) {
        self.movieList.append(objectsIn: list)
        tableView.reloadData()
        DLog(message: movieList.count)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieData = movieList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieListTableViewCell
        cell.setData(movieDetails: movieData)
        return cell
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movieList.count - 4 {
            presenter?.getMoreMovies()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelect(movie: movieList[indexPath.row])
    }
}
