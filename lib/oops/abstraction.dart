/*
 * Expose the essential behavior while hiding unnecessary implementation details.
 * Abstraction gives us:
 * loose coupling, easier testing, easier replacement, easier maintenance etc.
 *
 * */

abstract class Payment{
  void pay();
}