CREATE TABLE lists (
 `id` INT UNSIGNED NOT NULL auto_increment,
 `uuid` CHAR(36) NOT NULL default '',
 `ow` INT NOT NULL default 0,
 `name` VARCHAR(50) NOT NULL default '',
 `d_created` INT UNSIGNED NOT NULL default 0,
 `d_edited` INT UNSIGNED NOT NULL default 0,
 `sorting` TINYINT UNSIGNED NOT NULL default 0,
 `published` TINYINT UNSIGNED NOT NULL default 0,
 `taskview` INT UNSIGNED NOT NULL default 0,
 PRIMARY KEY(`id`),
 UNIQUE KEY(`uuid`)
) CHARSET=utf8;

CREATE TABLE todolist (
 `id` INT UNSIGNED NOT NULL auto_increment,
 `uuid` CHAR(36) NOT NULL default '',
 `list_id` INT UNSIGNED NOT NULL default 0,
 `d_created` INT UNSIGNED NOT NULL default 0,   /* time() timestamp */
 `d_completed` INT UNSIGNED NOT NULL default 0, /* time() timestamp */
 `d_edited` INT UNSIGNED NOT NULL default 0,    /* time() timestamp */
 `compl` TINYINT UNSIGNED NOT NULL default 0,
 `title` VARCHAR(250) NOT NULL,
 `note` TEXT,
 `prio` TINYINT NOT NULL default 0,			/* priority -,0,+ */
 `ow` INT NOT NULL default 0,				/* order weight */
 `tags` VARCHAR(600) NOT NULL default '',	/* for fast access to task tags */
 `tags_ids` VARCHAR(250) NOT NULL default '', /* no more than 22 tags (x11 chars) */
 `duedate` DATE default NULL,
  PRIMARY KEY(`id`),
  KEY(`list_id`),
  UNIQUE KEY(`uuid`)
) CHARSET=utf8;

CREATE TABLE tags (
 `id` INT UNSIGNED NOT NULL auto_increment,
 `name` VARCHAR(50) NOT NULL,
 PRIMARY KEY(`id`),
 UNIQUE KEY `name` (`name`)
) CHARSET=utf8 ;

CREATE TABLE tag2task (
 `tag_id` INT UNSIGNED NOT NULL,
 `task_id` INT UNSIGNED NOT NULL,
 `list_id` INT UNSIGNED NOT NULL,
 KEY(`tag_id`),
 KEY(`task_id`),
 KEY(`list_id`)		/* for tagcloud */
) CHARSET=utf8 ;

