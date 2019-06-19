//
//  MovieDetailViewController.swift
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

/// Should be conformed to by the `MovieDetailViewController` and referenced by `MovieDetailPresenter`
protocol MovieDetailPresenterViewProtocol: class {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
    func showLoader()
    func removeLoader()
    func setMovieDetail(data: MovieDetailData)
}

// MARK: -

/// The View Controller for the MovieDetail module
class MovieDetailViewController: UIViewController, MovieDetailPresenterViewProtocol {
    
    

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieYearLabek: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var plotDescriptionTextView: UITextView!
    
    // MARK: - Constants

	let presenter: MovieDetailViewPresenterProtocol

	// MARK: Variables
    var movieData: MovieData?
    
	// MARK: Inits

	init(presenter: MovieDetailViewPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: "MovieDetailViewController", bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Load Functions

	override func viewDidLoad() {
    	super.viewDidLoad()
		presenter.viewLoaded()
		view.backgroundColor = .white
        
        
        if let movieData = movieData {
            setData(movieData: movieData)
        }
        
        if let movieID = movieData?.imdbID {
            presenter.getMovieDetail(imdbID: movieID)
        }
    }

	// MARK: - MovieDetail Presenter to View Protocol

	func set(title: String?) {
		self.title = title
	}
    
    func setData(movieData: MovieData) {
        if let link = movieData.poster, let url = URL(string: link) {
            posterImageView.kf.setImage(with: url)
        }
        movieNameLabel.text = movieData.title
        movieYearLabek.text = movieData.year
        typeLabel.text = movieData.type
        
    }
    
    func setMovieDetail(data: MovieDetailData) {
        plotDescriptionTextView.text = data.plot
    }
}
