import 'package:flutter/material.dart';
import 'package:shop_app/common_widget/readmore_text.dart';
import 'package:shop_app/common_widget/rounded_container.dart';
import 'package:shop_app/view/product_reviews/widgets/rating_bar_indicator.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage("assets/img/u1.png")),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Văn Tèo',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16 / 2),
                    Row(
                      children: [
                        const TRatingBarIndicator(rating: 5),
                        const SizedBox(width: 16),
                        Text('24-12-2023',
                            style: Theme.of(context).textTheme.bodyMedium)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),

        ///Reviews
        const SizedBox(height: 16),
        const TReadMoreText(
            text:
                'shop giao hành siêu nhanh luôn. m ở hnoi 3 hôm đã nhận được hàng rồi. thích cái chất vải bên shop lắm . ck m mặc cứ khen lắm. chất mặc mát thấm hút tốt. fom chuẩn mặc tôn dáng lắm'),
        const SizedBox(height: 16),

        ///Company Reviews
        RoundedContainer(
          backgroundColor: Colors.grey.shade400,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('WearMe Shop',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('25-12-2023',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: 16),
                const TReadMoreText(
                    text:
                        'WearMe xin chân thành cảm ơn anh/chị đã dành tặng cho shop đánh giá 5 sao. Sự hài lòng của anh/chị là niềm động lực lớn lao để shop tiếp tục cố gắng và hoàn thiện hơn nữa. WearMe sẽ luôn nỗ lực để mang đến cho khách hàng những trải nghiệm mua sắm tuyệt vời nhất và shop hy vọng sẽ được tiếp tục phục vụ mình trong những đơn hàng tiếp theo. Một lần nữa, WearMe xin chân thành cảm ơn anh/chị!')
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Divider(color: Colors.grey[300]),
        const SizedBox(height: 16),
      ],
    );
  }
}
