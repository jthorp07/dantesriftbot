CREATE TABLE DiscordMessage(

    -- COLUMNS --
    GuildId CHAR(18) NOT NULL,
    ChannelId CHAR(18) NOT NULL,
    MessageId CHAR(18) NOT NULL,
    MessageName VARCHAR(32) NOT NULL,

    -- CONSTRAINTS --
    CONSTRAINT PK_DiscordMessage PRIMARY KEY(GuildId, ChannelId, MessageId),
    CONSTRAINT FK_DiscordMessage_DiscordChannel FOREIGN KEY(GuildId, ChannelId)
        REFERENCES DiscordChannel(GuildId, ChannelId),
    CONSTRAINT UNQ_DiscordMessage_Name UNIQUE(GuildId, MessageName) -- IDK If this is correct for unique constraint
)