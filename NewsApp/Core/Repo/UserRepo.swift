//
//  UserRepo.swift
//  AlbumApp
//
//  Created by Ahmed on 8/23/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import Promises

protocol UserRepo {
    func getUserInfo() -> Promise<UserModel>
    func getAlbumes() -> Promise<AlbumModels>
    func getPhotos(albumId : Int) -> Promise<photoModels>


}
