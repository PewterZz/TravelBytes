//
//  SplashView.swift
//  TravelBytes
//
//  Created by Peter Subrata on 16/8/2024.
//

import SwiftUI

struct SplashView: View {
    @State private var navigateToLogin = false
    @State private var splashFinished = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if !splashFinished {
                    AnimationView()
                        .transition(.opacity)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    withAnimation(.easeOut(duration: 1)) {
                        splashFinished = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        navigateToLogin = true
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToLogin) {
                OnboardingView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct LogoPiece: Identifiable {
    let id = UUID()
    let image: Image
}

struct Crumbs: Identifiable {
    let id = UUID()
    let image: Image
}



struct AnimationView: View {
    @State private var animateDrop = Array(repeating: false, count: 3)
    @State private var animateEatTop = false
    @State private var animateEatBottom = false
    @State private var animateLunch = false
    @State private var animateDestroy = false
    @State private var animateFall = false
    @State private var animateAppear = false

    private let logoPieces = [
        LogoPiece(image: Image("bottomlogo")),
        LogoPiece(image: Image("logoname")),
        LogoPiece(image: Image("toplogo"))
    ]
    
//    private let CrumbOffsets = [100,200,300,400,500]
//    
//    private let crumbPieces = [
//        Crumbs(image: Image("crumbs")),
//        Crumbs(image: Image("crumbs")),
//        Crumbs(image: Image("crumbs")),
//        Crumbs(image: Image("crumbs")),
//        Crumbs(image: Image("crumbs"))
//    ]

    var body: some View {
        ZStack {
            Color(hex: "#40E0D0")
                .edgesIgnoringSafeArea(.all)
            
            Image("crumbs")
                .offset(CGSize(width: 15.0, height: 10.0)).zIndex(2.0)
                .opacity(0.8)
                .modifier(CrumbsFalling(index: 0, 
                                        animateAppear: animateAppear,
                                        animateFall: animateFall))
            Image("crumbs")
                .offset(CGSize(width: 40.0, height: 10.0))
                .zIndex(2.0).opacity(0.8)
                .modifier(CrumbsFalling(index: 1, animateAppear: animateAppear, animateFall: animateFall))
            Image("crumbs")
                .offset(CGSize(width: 80.0, height: 30.0))
                .zIndex(2.0).opacity(0.8)
                .modifier(CrumbsFalling(index: 2, animateAppear: animateAppear, animateFall: animateFall))
            Image("crumbs")
                .offset(CGSize(width: -40.0, height: 60.0))
                .zIndex(2.0).opacity(0.8)
                .modifier(CrumbsFalling(index: 3, animateAppear: animateAppear, animateFall: animateFall))
            Image("crumbs")
                .offset(CGSize(width: -40.0, height: -60.0))
                .zIndex(2.0).opacity(0.8)
                .modifier(CrumbsFalling(index: 4, animateAppear: animateAppear, animateFall: animateFall))
            Image("crumbs")
                .offset(CGSize(width: 0.0, height: -80.0))
                .zIndex(2.0).opacity(0.8)
                .modifier(CrumbsFalling(index: 5, animateAppear: animateAppear, animateFall: animateFall))
            Image("crumbs")
                .offset(CGSize(width: 0.0, height: 40.0))
                .zIndex(2.0).opacity(0.8)
                .modifier(CrumbsFalling(index: 6, animateAppear: animateAppear, animateFall: animateFall))
            Image("crumbs")
                .offset(CGSize(width: -90.0, height: 0.0))
                .zIndex(2.0).opacity(0.8)
                .modifier(CrumbsFalling(index: 7, animateAppear: animateAppear, animateFall: animateFall))

            AnimationLayout(animateDrop: animateDrop, animateEatTop: animateEatTop, animateLunch: animateLunch, animateEatBottom: animateEatBottom, animateDestroy: animateDestroy, animateFall: animateFall) {
                
                if logoPieces.indices.contains(2) {
                    logoPieces[2].image
                        .resizable()
                        .frame(width: 350, height: 350)
                        .modifier(DropAndDestroyModifier(
                            index: 2,
                            animateDrop: animateDrop[2],
                            animateDestroy: animateDestroy
                        ))
                        .modifier(EatingAnimationTop(
                            index: 2,
                            animateEatTop: animateEatTop))
                        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                }

                if logoPieces.indices.contains(1) {
                    logoPieces[1].image
                        .resizable()
                        .frame(width: 350, height: 350)
                        .modifier(DropAndDestroyModifier(
                            index: 1,
                            animateDrop: animateDrop[1],
                            animateDestroy: animateDestroy
                        ))
                        .modifier(LogoFlattening(
                            index: 1,
                            animateLunch: animateLunch))
                }

                if logoPieces.indices.contains(0) {
                    logoPieces[0].image
                        .resizable()
                        .frame(width: 350, height: 350)
                        .modifier(DropAndDestroyModifier(
                            index: 0,
                            animateDrop: animateDrop[0],
                            animateDestroy: animateDestroy
                        ))
                        .modifier(EatingAnimationBottom(
                            index: 0,
                            animateEatBottom: animateEatBottom))
                        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                }
            }
            
            HStack{
                
                Text("navigate •")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .offset(CGSize(width: 0.0, height: 100.0))
                Text("explore •")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .offset(CGSize(width: 0.0, height: 100.0))
                Text("bite")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .offset(CGSize(width: 0.0, height: 100.0))
            }
        }
        .onAppear {
            for index in logoPieces.indices {
                withAnimation(Animation.easeIn(duration: 0.4).delay(Double(index) * 0.7)) {
                    animateDrop[index] = true
                }
            }
            
            withAnimation(Animation.easeIn(duration: 0.5).delay(2)) {
                animateEatTop = true
            }
            
            withAnimation(Animation.easeIn(duration: 0.5).delay(2)) {
                animateLunch = true
            }
            
            withAnimation(Animation.easeIn(duration: 0.5).delay(2)) {
                animateEatBottom = true
            }
            
            withAnimation(Animation.easeIn(duration: 0.1).delay(2.3)){
                animateAppear = true
            }

            withAnimation(Animation.easeIn(duration: 1).delay(Double(logoPieces.count) * 0.5 + 1)) {
                animateDestroy = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(Animation.easeIn(duration: 1)) {
                    animateFall = true
                }
            }
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct AnimationLayout: Layout {
    let animateDrop: [Bool]
    let animateEatTop: Bool
    let animateLunch: Bool
    let animateEatBottom: Bool
    let animateDestroy: Bool
    let animateFall: Bool

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for index in subviews.indices {
            let subview = subviews[index]
            let initialOffset: CGSize
            let dropOffset: CGSize

            switch index {
            case 0:
                initialOffset = CGSize(width: 0, height: -500)
                dropOffset = CGSize(width: 0, height: -20)
            case 1:
                initialOffset = CGSize(width: 0, height: -500)
                dropOffset = CGSize(width: 0, height: -20)
            case 2:
                initialOffset = CGSize(width: 0, height: -500)
                dropOffset = CGSize(width: 0, height: -20)
            default:
                initialOffset = .zero
                dropOffset = .zero
            }

            let finalPosition = animateDrop[index] ? dropOffset : initialOffset

            subview.place(
                at: CGPoint(x: bounds.midX + finalPosition.width, 
                            y: bounds.midY + finalPosition.height),
                anchor: .center,
                proposal: .unspecified
            )
        }
    }
}

struct EatingAnimationTop: ViewModifier {
    var index: Int
    var animateEatTop: Bool
    
    func body(content: Content) -> some View {
        let modifyScale: CGFloat = animateEatTop ? 1.2 : 1
        let modifyRotation: Angle = animateEatTop ? .degrees(180) : .zero
        let modifyOffset: CGFloat = animateEatTop ? 50 : 0 // Adjust the offset value as needed
        
        return content
            .scaleEffect(modifyScale)
            .offset(y: animateEatTop ? modifyOffset : 0)
    }
}

struct LogoFlattening: ViewModifier {
    var index: Int
    var animateLunch: Bool
    
    func body(content: Content) -> some View {
        let flatten: CGFloat = animateLunch ? 100 : 500
        let modifyScale: CGFloat = animateLunch ? 0.1 : 1
        let modifyRotation: Angle = animateLunch ? .degrees(180) : .zero
        let modifyOpacity: Double = animateLunch ? 0 : 1
        
        return content
            .opacity(modifyOpacity)
    }
}

struct EatingAnimationBottom: ViewModifier {
    var index: Int
    var animateEatBottom: Bool
    
    func body(content: Content) -> some View {
        let modifyScale: CGFloat = animateEatBottom ? 1.2 : 1
        let modifyRotation: Angle = animateEatBottom ? .degrees(180) : .zero
        let modifyOffset: CGFloat = animateEatBottom ? -50 : 0 // Adjust the offset value as needed
        
        return content
            .scaleEffect(modifyScale)
            .offset(y: animateEatBottom ? modifyOffset : 0)
    }
}

struct CrumbsFalling: ViewModifier {
    
    // MARK: - Crumbs Animation
    
    var index: Int
    var animateAppear: Bool
    var animateFall: Bool

    func body(content: Content) -> some View {
        let modifyScale: CGFloat = animateAppear ? 1 : 0
        let move: CGFloat = animateFall ? 1700 : 0
        
        return content
            .scaleEffect(modifyScale)
            .offset(y: move)
//            .animation(Animation.easeInOut(duration: 0.6).delay(Double(index) * 0.1), value: animateFall)
    }
}

struct DropAndDestroyModifier: ViewModifier {
    var index: Int
    var animateDrop: Bool
    var animateDestroy: Bool

    func body(content: Content) -> some View {
        let destroyScale: CGFloat = animateDestroy ? 0 : 1
        let destroyRotation: Angle = animateDestroy ? .degrees(180) : .zero
        let destroyOpacity: Double = animateDestroy ? 0 : 1

        return content
            .scaleEffect(destroyScale)
            .rotationEffect(destroyRotation)
            .opacity(destroyOpacity)
    }
}

#Preview {
    SplashView()
}
