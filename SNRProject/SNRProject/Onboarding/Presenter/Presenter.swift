import Foundation

protocol LoginAndRegistrationPresenterProtocol: AnyObject {
    func signInPressed(email: String?, password: String?)
    func signUpPressed()
    func signUpFromLoginPressed()
    func signInWithGooglePressed()
}

final class LoginAndRegistrationPresenter: LoginAndRegistrationPresenterProtocol {
    
    weak var view: LoginRegistrationViewProtocolForPresenter?
    
    func signInPressed(email: String?, password: String?) {
        print("yo")
    }
    
    func signUpPressed() {
        print("sign up")
    }
    
    func signUpFromLoginPressed() {
        print("sign up pressed")
    }
    
    func signInWithGooglePressed() {
        print("sign in with google pressed")
    }
}
