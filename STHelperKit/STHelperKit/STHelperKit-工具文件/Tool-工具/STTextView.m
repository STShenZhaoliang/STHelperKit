//
//  STTextView.m
//  STHelperKit
//
//  Created by ST on 16/8/19.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "STTextView.h"

static CGFloat const STTextViewLabelX = 6.0;
static CGFloat const STTextViewLabelY = 7.0;
#define STTextViewLabelW (self.frame.size.width - 2 * STTextViewLabelX)

NS_ASSUME_NONNULL_BEGIN

@interface STTextView ()
/** 占位文字label */
@property (nonatomic, weak)UILabel *labelPlaceholder;
@end

NS_ASSUME_NONNULL_END

@implementation STTextView

#pragma mark - --- 1.init 生命周期 ---

- (instancetype)init
{
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       [self setupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setupUI];
}

- (void)setupUI
{
    // 1.自身属性
    self.font = [UIFont systemFontOfSize:17];
    
    // 2.设置默认的占位文字颜色， gray的70%
    self.placeholderColor = [UIColor colorWithWhite:0.35 alpha:1];
    
    // 3.监听文字
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.labelPlaceholder.frame = CGRectMake(STTextViewLabelX, STTextViewLabelY, STTextViewLabelW, 0);
    [self.labelPlaceholder sizeToFit];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - --- 2.delegate 视图委托 ---

#pragma mark - --- 3.event response 事件相应 ---
- (void)textDidChangeNotification {
    // 有文字就隐藏占位文字
    self.labelPlaceholder.hidden = self.hasText;
}
#pragma mark - --- 4.private methods 私有方法 ---

#pragma mark - --- 5.setters 属性 ---
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    _placeholderColor = placeholderColor;
    self.labelPlaceholder.textColor = placeholderColor;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];
    self.labelPlaceholder.text = placeholder;
    [self setNeedsLayout];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.labelPlaceholder.font = font;
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textDidChangeNotification];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    [self textDidChangeNotification];
}
#pragma mark - --- 6.getters 属性 —--
- (UILabel *)labelPlaceholder
{
    if (_labelPlaceholder == nil) {
        UILabel *labelPlaceholder = [[UILabel alloc] init];
        labelPlaceholder.numberOfLines = 0;
        [self addSubview:labelPlaceholder];
        _labelPlaceholder = labelPlaceholder;
    }
    return _labelPlaceholder;
}
@end
