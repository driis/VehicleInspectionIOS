#import <CoreGraphics/CoreGraphics.h>
#import "InspectionTableViewCell.h"


@implementation InspectionTableViewCell
{

}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.minimumFontSize = 10;
    CGRect frame = self.textLabel.frame;
    self.textLabel.frame = CGRectMake(frame.origin.x, frame.origin.y, 185, frame.size.height);

    self.detailTextLabel.minimumFontSize = 10;
    self.detailTextLabel.adjustsFontSizeToFitWidth = YES;
    frame = self.detailTextLabel.frame;
    self.detailTextLabel.textAlignment = UITextAlignmentRight;
    self.detailTextLabel.frame = CGRectMake(190, frame.origin.y, 105, frame.size.height);
}

@end