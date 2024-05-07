//
//  HomeInteractor.swift
//  
//
//  Created by 유준용 on 3/25/24.
//

import RIBs
import ProxyModule
import FirebaseFirestore

public protocol HomeRouting: ViewableRouting { }

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }

}

public protocol HomeListener: AnyObject {

}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {

    weak var router: HomeRouting?
    weak var listener: HomeListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: HomePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // Add a new document with a generated ID
        Task {
            do {
                let db = Firestore.firestore()
                let ref = try await db.collection("users").addDocument(data: [
                    "nickName": "Adam",
                
                ])
                print("Document added with ID: \(ref.documentID)")
            } catch {
                print("Error adding document: \(error)")
            }
        }

    }

    override func willResignActive() {
        super.willResignActive()
    }
}
