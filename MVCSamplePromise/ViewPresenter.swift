//
//  ViewPresenter.swift
//  MVCSamplePromise
//
//  Created by 中村太郎 on 2023/11/14.
//

import Foundation
import PromiseKit

protocol ViewPresenter: AnyObject {
    init(view: View)
    func task1Api() -> Promise<String>
    func task2Api() -> Promise<String>
    func allRunApi()
}

final class MVCViewPresenter: ViewPresenter {
    private weak var view: View?
    
    init(view: View) {
        self.view = view
    }
    
    func task1Api() -> Promise<String> {
        sleep(3)
        return Promise { seal in
            return  seal.fulfill("task1")
        }
    }
    
    func task2Api() -> Promise<String> {
        sleep(3)
        return Promise { seal in
            return seal.fulfill("task2")
        }
    }
    
    func allRunApi() {
        self.view?.showLoading()
        task1Api().then { data1 in
            self.view?.applyData1(data1: data1)
            return self.task2Api()
        }.done { data2 in
            self.view?.applyData2(data2: data2)
            self.view?.hideLoading()
        }                    
    }
}


