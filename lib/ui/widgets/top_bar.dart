part of 'widgets.dart';

class TopBar extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final String centerTitle;
  final Function fun;
  final IconData iconEnd;

  const TopBar(
      {Key key,
      this.icon,
      this.onTap,
      this.centerTitle,
      this.fun,
      this.iconEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 800),
      slidingBeginOffset: Offset(0, -4),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: defMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
          color: white,
        ),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: onTap,
                  child: Icon(
                    icon,
                    color: blackPearl,
                  ),
                ),
              ),
              Center(
                child: Text(
                  centerTitle,
                  style: standardStyle.copyWith(fontSize: 16),
                ),
              ),
              (fun != null)
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: fun,
                        child: Icon(
                          iconEnd,
                          color: primaryColor,
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
