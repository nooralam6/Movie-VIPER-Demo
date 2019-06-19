//
//  MovieDetailBase.swift
//  MovieVIPERDemo
//
//  Created by new on 19/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import Foundation
import RealmSwift

class MovieDetailData : Object, Decodable {
    @objc dynamic var title : String?
    @objc dynamic var year : String?
    @objc dynamic var rated : String?
    @objc dynamic var released : String?
    @objc dynamic var runtime : String?
    @objc dynamic var genre : String?
    @objc dynamic var director : String?
    @objc dynamic var writer : String?
    @objc dynamic var actors : String?
    @objc dynamic var plot : String?
    @objc dynamic var language : String?
    @objc dynamic var country : String?
    @objc dynamic var awards : String?
    @objc dynamic var poster : String?
    let ratings = List<Ratings>()
    @objc dynamic var metascore : String?
    @objc dynamic var imdbRating : String?
    @objc dynamic var imdbVotes : String?
    @objc dynamic var imdbID : String?
    @objc dynamic var type : String?
    @objc dynamic var dVD : String?
    @objc dynamic var boxOffice : String?
    @objc dynamic var production : String?
    @objc dynamic var website : String?
    @objc dynamic var response : String?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case dVD = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        year = try values.decodeIfPresent(String.self, forKey: .year)
        rated = try values.decodeIfPresent(String.self, forKey: .rated)
        released = try values.decodeIfPresent(String.self, forKey: .released)
        runtime = try values.decodeIfPresent(String.self, forKey: .runtime)
        genre = try values.decodeIfPresent(String.self, forKey: .genre)
        director = try values.decodeIfPresent(String.self, forKey: .director)
        writer = try values.decodeIfPresent(String.self, forKey: .writer)
        actors = try values.decodeIfPresent(String.self, forKey: .actors)
        plot = try values.decodeIfPresent(String.self, forKey: .plot)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        awards = try values.decodeIfPresent(String.self, forKey: .awards)
        poster = try values.decodeIfPresent(String.self, forKey: .poster)
        let ratingsData = try values.decode([Ratings].self, forKey: .ratings)
        ratings.append(objectsIn: ratingsData)
        metascore = try values.decodeIfPresent(String.self, forKey: .metascore)
        imdbRating = try values.decodeIfPresent(String.self, forKey: .imdbRating)
        imdbVotes = try values.decodeIfPresent(String.self, forKey: .imdbVotes)
        imdbID = try values.decodeIfPresent(String.self, forKey: .imdbID)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        dVD = try values.decodeIfPresent(String.self, forKey: .dVD)
        boxOffice = try values.decodeIfPresent(String.self, forKey: .boxOffice)
        production = try values.decodeIfPresent(String.self, forKey: .production)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        response = try values.decodeIfPresent(String.self, forKey: .response)
    }
    
}
