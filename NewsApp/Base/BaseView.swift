
import Foundation
import UIKit
import JGProgressHUD
import SwiftMessages

class BaseView<ViewModel: BaseVM, Item: BaseItem>: UIViewController {
    let frame = UIScreen.main.bounds
    var item: Item!
    let hud = JGProgressHUD(style: .dark)
    
    var viewModel: ViewModel! {
        didSet {
            viewModel.implementAlert { (alert) in
                self.showAlertMessage(title: "", message: alert, theme: .success)
            }
            
            viewModel.implementErrorMessage { (error) in
                self.showAlertMessage(title: "", message: error, theme: .error)
            }
            viewModel.implementCustomAlert { (title,message ) in
                self.showCustomAlert(title: title, message: message)
            }

            viewModel.isLoading.bind { (loading) in
                if loading {
                    self.showLoading()
                } else {
                    self.hideLoading()
                }
            }
        }
    }
        
   public func puplicAlert(title: String, message: String, theme: Theme){
        self.showAlertMessage(title: "", message: message, theme: theme)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationItem.backBarButtonItem?.title = ""
    }
     
    func showLoading() {
        self.hud.show(in: self.view)
    }
    
    func hideLoading(){
        self.hud.dismiss()
    }

    func bindind() {}
}

extension BaseView {
    
    private func showCustomAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alert.view.tintColor = #colorLiteral(red: 0.4549019608, green: 0.1098039216, blue: 0.8941176471, alpha: 1)
        self.present(alert, animated: true, completion: nil)

    }

    private func showAlertMessage(title: String, message: String, theme: Theme) {
        let success = MessageView.viewFromNib(layout: .messageView)
        success.configureTheme(theme)
        success.configureDropShadow()
        success.configureContent(title: title, body: message)
        success.button?.isHidden = true
        var successConfig = SwiftMessages.defaultConfig
        successConfig.dimMode = .blur(style: .dark, alpha: 0.4, interactive: true)
        successConfig.presentationStyle = .top
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: successConfig, view: success)

    }
}
