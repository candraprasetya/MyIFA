part of 'widgets.dart';

class BoxBalance extends StatelessWidget {
  final Color color;
  final String value;
  final String desc;
  final bool isBalance;
  final int duration;

  const BoxBalance(
      {Key key,
      this.color,
      this.value,
      this.desc,
      this.isBalance,
      this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(milliseconds: duration - 200),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dotDot(),
                    SizedBox(
                      height: 12,
                    ),
                    DelayedDisplay(
                      delay: Duration(milliseconds: duration),
                      child: Text(
                        value,
                        style: standardStyle.copyWith(fontSize: 26),
                      ),
                    ),
                    DelayedDisplay(
                      delay: Duration(milliseconds: duration + 400),
                      child: Text(
                        desc,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: standardStyle.copyWith(
                            fontSize: 12, color: blackPearl.withOpacity(.4)),
                      ),
                    ),
                  ],
                ),
              ),
              (isBalance)
                  ? Expanded(
                      flex: 1,
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: duration + 800),
                        child: SvgPicture.asset(
                          icMoney,
                          height: 36,
                        ),
                      ))
                  : SizedBox()
            ],
          )),
    );
  }

  Widget dotDot() {
    return Stack(
      alignment: Alignment.center,
      children: [
        DelayedDisplay(
          slidingCurve: Curves.fastOutSlowIn,
          slidingBeginOffset: Offset(0, 0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: color.withOpacity(.3),
                borderRadius: BorderRadius.circular(100)),
          ),
        ),
        DelayedDisplay(
          slidingBeginOffset: Offset(0, 0),
          slidingCurve: Curves.fastOutSlowIn,
          delay: Duration(milliseconds: 800),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(100)),
          ),
        ),
      ],
    );
  }
}
