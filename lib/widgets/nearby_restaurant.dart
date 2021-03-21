import 'package:flutter/material.dart';
import 'package:flutter_delivery_ui/screens/restraunt_screen.dart';
import 'package:flutter_delivery_ui/widgets/rating_stars.dart';

import '../data/data.dart';
import '../models/restaurant.dart';

import '../styles.dart';

class NearbyRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Nearby Restaurants',
            style: PrimaryHeading,
          ),
        ),
        _buildRestaurants(context),
      ],
    );
  }

  _buildRestaurants(context) {
    List<Widget> restaurantList = [];
    restaurants.forEach(
      (Restaurant restaurant) {
        return restaurantList.add(
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: restaurant),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(width: 1.0, color: Colors.grey[200]),
              ),
              child: Row(
                children: [
                  Hero(
                    tag: restaurant.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        height: 150.0,
                        width: 150.0,
                        image: AssetImage(restaurant.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          restaurant.name,
                          style: HeadingStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        RatingStars(restaurant.rating),
                        SizedBox(height: 4.0),
                        Text(
                          restaurant.address,
                          style: SubHeadingStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "0.2 miles away",
                          style: SubHeadingStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    return Column(
      children: restaurantList,
    );
  }
}
