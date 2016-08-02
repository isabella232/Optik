//
//  AnimatableProperty.swift
//  Optik
//
//  Created by Htin Linn on 7/24/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

/**
 *  Defines an animatable property for the animation system.
 */
internal protocol AnimatableProperty {
    
    /// Underlying property type.
    associatedtype PropertyType: VectorRepresentable
    
    /// Threshold value to use in determining if an animation is considered complete.
    var threshold: CGFloat { get }
    
    /// Lens for reading and writing values.
    var lens: Lens<UIView, [CGFloat]> { get }
    
}

/**
 *  View frame animatable property.
 */
internal struct ViewFrame: AnimatableProperty {
    
    typealias PropertyType = CGRect
    
    let threshold: CGFloat = 0.1
    let lens: Lens<UIView, [CGFloat]> = Lens<UIView, [CGFloat]>(
        get: { $0.frame.values },
        set: { $1.frame = CGRect($0); return $1 }
    )
    
}

/**
 *  View alpha animatable property.
 */
internal struct ViewAlpha: AnimatableProperty {
    
    typealias PropertyType = CGFloat
    
    let threshold: CGFloat = 0.01
    let lens: Lens<UIView, [CGFloat]> = Lens(
        get: { $0.alpha.values },
        set: { $1.alpha = CGFloat($0); return $1 }
    )
    
}
