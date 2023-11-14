//
//  ViewController.swift
//  MVCSamplePromise
//
//  Created by 中村太郎 on 2023/11/14.
//

import UIKit

protocol View: AnyObject {
    func showLoading()
    func hideLoading()
    func applyData1(data1: String)
    func applyData2(data2: String)
}

class ViewController: UIViewController, View {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    private lazy var presenter: ViewPresenter = MVCViewPresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter.allRunApi()
    }

    func showLoading() {
        self.view.showLoading()
    }
    
    func hideLoading() {
        self.view.hideLoading()
    }

    func applyData1(data1: String) {
        label1.text = data1
    }

    func applyData2(data2: String) {
        label2.text = data2
    }


}

