CREATE TABLE DiscordUser(

    Id CHAR(18) NOT NULL,
    Username VARCHAR(32) NOT NULL,
    IsPremium BIT NOT NULL,
    BotLevel INT NOT NULL,
    BotXP INT NOT NULL,

    CONSTRAINT PK_DiscordUser PRIMARY KEY(Id)

)