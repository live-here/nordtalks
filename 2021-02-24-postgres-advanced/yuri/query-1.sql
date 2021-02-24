select username, message, ROW_NUMBER () over (partition by username) from message
