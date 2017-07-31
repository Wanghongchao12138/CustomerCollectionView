# CustomerCollectionView
 自定义瀑布流（可添加自定义header和footer）

![image](https://github.com/Wanghongchao12138/CustomerCollectionView/blob/master/6pssss.gif)   
 
 /*
    设置cell  的宽高
*/
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(WHCWaterfallFlowLayout*)collectionViewLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPath;

/*
    设置collection 的头视图的size
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(WHCWaterfallFlowLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

/*
    设置collection footer 视图的size
*/
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(WHCWaterfallFlowLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

 


