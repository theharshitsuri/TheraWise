import 'dart:math';
import 'package:flutter/cupertino.dart';

class QuotesPage {
  static const List<String> quotes = [
    "Every day may not be good, but there's something good in every day.",
    "You are capable of amazing things.",
    "Believe you can and you're halfway there.",
    "Don't watch the clock; do what it does. Keep going.",
    "Keep your face always toward the sunshine—and shadows will fall behind you.",
    "The only way to do great work is to love what you do.",
    "Your limitation—it's only your imagination.",
    "Push yourself, because no one else is going to do it for you.",
    "Sometimes later becomes never. Do it now.",
    "Great things never come from comfort zones.",
    "Dream it. Wish it. Do it.",
    "Success doesn't just find you. You have to go out and get it.",
    "The harder you work for something, the greater you'll feel when you achieve it.",
    "Dream bigger. Do bigger.",
    "Don't stop when you're tired. Stop when you're done.",
    "Wake up with determination. Go to bed with satisfaction.",
    "Do something today that your future self will thank you for.",
    "Little things make big days.",
    "It's going to be hard, but hard does not mean impossible.",
    "Don't wait for opportunity. Create it.",
    "Sometimes we're tested not to show our weaknesses, but to discover our strengths.",
    "The key to success is to focus on goals, not obstacles.",
    "Dream it. Believe it. Build it.",
    "Stay positive, work hard, make it happen.",
    "Don't stop until you're proud.",
    "Work hard in silence, let your success be the noise.",
    "The way to get started is to quit talking and begin doing.",
    "The future depends on what you do today.",
    "Your time is limited, don't waste it living someone else's life.",
    "You don't have to be great to start, but you have to start to be great.",
    "Success is not how high you have climbed, but how you make a positive difference to the world.",
    "Act as if what you do makes a difference. It does.",
    "Motivation is what gets you started. Habit is what keeps you going.",
    "Don't be pushed around by the fears in your mind. Be led by the dreams in your heart.",
    "Start where you are. Use what you have. Do what you can.",
    "Go the extra mile. It's never crowded there.",
    "Your passion is waiting for your courage to catch up.",
    "Success is not final, failure is not fatal: it is the courage to continue that counts.",
    "Believe in yourself, take on your challenges, dig deep within yourself to conquer fears.",
    "With the new day comes new strength and new thoughts.",
    "It does not matter how slowly you go as long as you do not stop.",
    "We may encounter many defeats but we must not be defeated.",
    "Do what you can with all you have, wherever you are.",
    "You are never too old to set another goal or to dream a new dream.",
    "To see what is right and not do it is a lack of courage.",
    "Reading is to the mind, as exercise is to the body.",
    "The only limit to our realization of tomorrow is our doubts of today.",
    "Creativity is intelligence having fun.",
    "What you get by achieving your goals is not as important as what you become by achieving your goals.",
    "If you can dream it, you can do it."
  ];

  static String getRandomQuote() {
    final random = Random();
    return quotes[random.nextInt(quotes.length)];
  }
}
