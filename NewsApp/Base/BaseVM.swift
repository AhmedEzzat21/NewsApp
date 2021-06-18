
import Foundation

class BaseVM {
    
    init() {
        hydrate()
    }
    
    func hydrate() {}
    
    private var errorMessage: DynamicObjects<String> = DynamicObjects("")
    private var alertMessage: DynamicObjects<String> = DynamicObjects("")
    private var customAlert: DynamicObjects<(String,String)> = DynamicObjects(("",""))
    var isLoading: DynamicObjects<Bool> = DynamicObjects(false)

    func showSystemError(error: Error) {
        errorMessage.value = error.localizedDescription
    }
    func showSystemError(error: String) {
        errorMessage.value = error
    }
    
    func showSystemAlert(alert: String) {
        alertMessage.value = alert
    }
    
    func showCutomAlert(title: String,message: String) {
        customAlert.value = (title,message)
    }

    func implementErrorMessage(_ listener: @escaping (String) -> Void) {
        errorMessage.bind(listener)
    }
    
    func implementAlert(_ listener: @escaping (String) -> Void) {
        alertMessage.bind(listener)
    }
    
    func implementCustomAlert(_ listener: @escaping (String,String) -> Void) {
        customAlert.bind(listener)
    }
    
    func showLoading() {
        isLoading.value = true
    }
    
    func hideLoading() {
        isLoading.value = false
    }
}
