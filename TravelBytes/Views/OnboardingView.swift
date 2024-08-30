import SwiftUI

struct OnboardingView: View {
    @State private var showingSignIn = true
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            TabsView() // Assuming TabsView is defined elsewhere
        } else {
            if showingSignIn {
                LoginView(showingSignIn: $showingSignIn, isLoggedIn: $isLoggedIn)
            } else {
                CreateAccountView(showingSignIn: $showingSignIn)
            }
        }
    }
}

struct CreateAccountView: View {
    @Binding var showingSignIn: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Create your account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.white.opacity(0.7))
                .cornerRadius(10)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white.opacity(0.7))
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color.white.opacity(0.7))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                // Handle account creation action
            }) {
                Text("CREATE ACCOUNT")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(UIColor.systemGreen))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.white)
                Button(action: {
                    withAnimation {
                        showingSignIn = true
                    }
                }) {
                    Text("SIGN IN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 30)
        }
        .background(Color.teal)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoginView: View {
    @Binding var showingSignIn: Bool
    @State private var email = ""
    @State private var password = ""
    @Binding var isLoggedIn: Bool
    
    private let dummyEmail = "user01"
    private let dummyPassword = "user01"
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Sign into your account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.white.opacity(0.7))
                .cornerRadius(10)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white.opacity(0.7))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                if email == dummyEmail && password == dummyPassword {
                    withAnimation {
                        isLoggedIn = true
                    }
                } else {
                    // Handle invalid credentials
                    print("Invalid credentials")
                }
            }) {
                Text("SIGN IN")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(UIColor.systemGreen))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            Text("or sign in with")
                .foregroundColor(.white)
                .padding(.top, 10)
            
            HStack(spacing: 20) {
                
                Button(action: {
                    
                }) {
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .background(Color(hex: "#40E0D0"))
                        .cornerRadius(10)
                }
                
                Button(action: {
                }) {
                    Image(systemName: "f.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .background(Color(hex: "#40E0D0"))
                        .cornerRadius(10)
                }
                
                Button(action: {
                }) {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .background(Color(hex: "#40E0D0"))
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20)
            
            Spacer()
            
            HStack {
                Text("Don’t have an account?")
                    .foregroundColor(.white)
                Button(action: {
                    withAnimation {
                        showingSignIn = false
                    }
                }) {
                    Text("SIGN UP")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 30)
        }
        .background(Color(hex: "#40E0D0"))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    OnboardingView()
}
