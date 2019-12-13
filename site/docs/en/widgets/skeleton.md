# Skeleton 

Skeleton provides a placeholder while you wait for content to load, or to visualise content that doesn't exist yet.

## FLSkeleton

You can configure shape, color, animation type, etc. The default animation type is *FLSkeletonAnimationType.shimmer*.

#### shimmer

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-ske_shimmer.gif" />
</p>

```dart
Container(
    padding: EdgeInsets.all(10),
    child: Card(
      child: Stack(
        children: <Widget>[
          FLSkeleton(
            shape: BoxShape.circle,
            margin: EdgeInsets.only(top: 10, left: 10),
            width: 40,
            height: 40,
          ),
          FLSkeleton(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(2),
            margin: EdgeInsets.only(left: 60, top: 10, right: 10),
            height: 20,
          ),
          FLSkeleton(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(2),
            margin: EdgeInsets.only(left: 60, top: 40),
            width: 300,
            height: 20,
          ),
          FLSkeleton(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(2),
            margin: EdgeInsets.only(left: 60, top: 70, bottom: 10),
            width: 100,
            height: 20,
          ),
        ],
      ),
    )
)
```

#### stretch

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-stretch.gif" />
</p>

```dart
Container(
    padding: EdgeInsets.all(10),
    child: Card(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            FLSkeleton(
              shape: BoxShape.circle,
              margin: EdgeInsets.only(top: 10, left: 10),
              active: false,
              width: 40,
              height: 40,
            ),
            FLSkeleton(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(2),
              type: FLSkeletonAnimationType.stretch,
              margin: EdgeInsets.only(left: 60, top: 10, right: 10),
              height: 20,
              width: 320,
              stretchWidth: 100,
            ),
            FLSkeleton(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(2),
              type: FLSkeletonAnimationType.stretch,
              margin: EdgeInsets.only(left: 60, top: 40),
              width: 300,
              stretchWidth: 150,
              height: 20,
            ),
            FLSkeleton(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(2),
              type: FLSkeletonAnimationType.stretch,
              margin: EdgeInsets.only(left: 60, top: 70, bottom: 10),
              width: 100,
              stretchWidth: 200,
              height: 20,
            ),
          ],
        ),
      )
    )
)
```

#### no animation

You only need to set the *active* property to false to not show the animation.

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-%E6%88%AA%E5%B1%8F2019-12-13%E4%B8%8B%E5%8D%884.53.04.png" />
</p>

```dart
Container(
    padding: EdgeInsets.all(10),
    child: Card(
      child: Stack(
        children: <Widget>[
          FLSkeleton(
            shape: BoxShape.circle,
            margin: EdgeInsets.only(top: 10, left: 10),
            active: false,
            width: 40,
            height: 40,
          ),
          FLSkeleton(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(2),
            margin: EdgeInsets.only(left: 60, top: 10, right: 10),
            active: false,
            height: 20,
          ),
          FLSkeleton(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(2),
            margin: EdgeInsets.only(left: 60, top: 40),
            active: false,
            width: 300,
            height: 20,
          ),
          FLSkeleton(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(2),
            margin: EdgeInsets.only(left: 60, top: 70, bottom: 10),
            active: false,
            width: 100,
            height: 20,
          ),
        ],
      ),
    )
)
```


