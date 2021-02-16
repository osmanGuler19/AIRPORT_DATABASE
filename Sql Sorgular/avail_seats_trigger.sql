CREATE TRIGGER avail_seats_trigger
AFTER INSERT ON fares
EXECUTE PROCEDURE avail_seat_consistency()