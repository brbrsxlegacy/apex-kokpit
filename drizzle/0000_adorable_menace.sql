CREATE TABLE `players` (
	`token` text PRIMARY KEY NOT NULL,
	`room` text NOT NULL,
	`name` text NOT NULL,
	`x` real DEFAULT 0 NOT NULL,
	`z` real DEFAULT 0 NOT NULL,
	`yaw` real DEFAULT 0 NOT NULL,
	`score` integer DEFAULT 0 NOT NULL,
	`lap` integer DEFAULT 0 NOT NULL,
	`seen` integer NOT NULL
);
--> statement-breakpoint
CREATE INDEX `idx_players_room` ON `players` (`room`);--> statement-breakpoint
CREATE TABLE `rooms` (
	`code` text PRIMARY KEY NOT NULL,
	`mode` text NOT NULL,
	`host` text NOT NULL,
	`start` integer DEFAULT 0 NOT NULL,
	`created` integer NOT NULL
);
