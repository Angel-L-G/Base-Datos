CREATE TABLE account_changes (
	change_no INTEGER PRIMARY KEY AUTOINCREMENT,
	account_no INTEGER NOT NULL, 
	flag TEXT NOT NULL, 
	amount DECIMAL NOT NULL, 
	changed_at TEXT NOT NULL 
);
