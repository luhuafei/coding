//
//  ProjectFolderListCell.m
//  Coding_iOS
//
//  Created by 王 原闯 on 14/10/29.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#define kProjectFolderListCell_IconWidth 45.0
#define kProjectFolderListCell_LeftPading (kPaddingLeftWidth +kProjectFolderListCell_IconWidth +20.0)

#import "ProjectFolderListCell.h"

@interface ProjectFolderListCell ()
@property (strong, nonatomic) UIImageView *iconView;
@property (strong, nonatomic) UILabel *nameLabel;
@end

@implementation ProjectFolderListCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundColor = [UIColor clearColor];
        // Initialization code
        if (!_iconView) {
            _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(kPaddingLeftWidth, ([ProjectFolderListCell cellHeight] - kProjectFolderListCell_IconWidth)/2, kProjectFolderListCell_IconWidth, kProjectFolderListCell_IconWidth)];
            [self.contentView addSubview:_iconView];
        }
        if (!_nameLabel) {
            _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kProjectFolderListCell_LeftPading, ([ProjectFolderListCell cellHeight] - 30)/2, (kScreen_Width - kProjectFolderListCell_LeftPading - 30), 30)];
            _nameLabel.textColor = [UIColor colorWithHexString:@"0x222222"];
            _nameLabel.font = [UIFont systemFontOfSize:16];
            [self.contentView addSubview:_nameLabel];
        }
        self.useToMove = NO;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (!_folder) {
        return;
    }
    if ([_folder isDefaultFolder]) {
        _iconView.image = [UIImage imageNamed:@"icon_file_folder_default"];
    }else{
        _iconView.image = [UIImage imageNamed:@"icon_file_folder_normal"];
    }
    _nameLabel.text = !_useToMove?
    [NSString stringWithFormat:@"%@（%ld）", _folder.name, (long)(_folder.fileCountIncludeSub)]
    :[NSString stringWithFormat:@"%@（%ld）", _folder.name, (long)_folder.sub_folders.count];
}

+ (CGFloat)cellHeight{
    return 75.0;
}
@end
