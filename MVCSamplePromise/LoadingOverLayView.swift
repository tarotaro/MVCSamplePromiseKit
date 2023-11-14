//
//  LoadingOverLayView.swift
//  MVCSample
//
//  Created by 中村太郎 on 2023/11/14.
//

import Foundation
import UIKit

fileprivate final class LoadingOverLayView: UIView {

    // MARK: - Property
    private var indicatorView: UIActivityIndicatorView!

    // MARK: - LifeCycle
    init(frame: CGRect, indicatorStyle: UIActivityIndicatorView.Style) {
        indicatorView = UIActivityIndicatorView(style: indicatorStyle)
        indicatorView.hidesWhenStopped = true
        super.init(frame: frame)
        addSubview(indicatorView)
        indicatorView.center = center
        backgroundColor = UIColor.black
        alpha = 0.4
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method
    func startAnimation() {
        indicatorView.startAnimating()
    }

    func stopAnimation() {
        indicatorView.stopAnimating()
    }
}

// MARK: - UIView Extension
extension UIView {

    /// LoadingViewを表示します
    ///
    /// - Parameter indicatorStyle: UIActivityIndicatorViewのstyle（gray, white, whiteLarge)
    func showLoading(with indicatorStyle: UIActivityIndicatorView.Style = .large) {
        // Loading中にはView操作をして欲しくないためユーザー操作を不可にしています
        isUserInteractionEnabled = false
        let overLayView = LoadingOverLayView(frame: frame, indicatorStyle: indicatorStyle)
        addSubview(overLayView)
        overLayView.startAnimation()
    }

    /// 表示されているIndicatorViewを非表示にします
    func hideLoading() {
        // Loadingを非表示にしたタイミングでユーザー操作を可能にしています
        isUserInteractionEnabled = true
        subviews.forEach { subView in
            if let subView = subView as? LoadingOverLayView {
                subView.stopAnimation()
                subView.removeFromSuperview()
            }
        }
    }
}
