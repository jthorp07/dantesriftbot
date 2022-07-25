CREATE OR ALTER PROCEDURE RegisterDiscordUser(
    @DiscordId CHAR(18),
    @Username VARCHAR(32),
    @GuildId CHAR(18),
    @IsOwner BIT
) AS BEGIN

    -- VALIDATE ARGS --
    IF @DiscordId IS NULL or @GuildId IS NULL BEGIN
        PRINT 'Args cannot be null'
        RETURN 1
    END

    IF EXISTS (SELECT * FROM DiscordGuildMember WHERE DiscordId = @DiscordId AND GuildId = @GuildId) BEGIN
        PRINT 'Guild member already registered'
        RETURN 2
    END

    -- IF NOT EXISTS REGISTER USER --
    IF NOT EXISTS (SELECT * FROM DiscordUser WHERE DiscordId = @DiscordId) BEGIN
        INSERT INTO DiscordUser(DiscordId, Username, IsPremium, BotLevel, BotXP)
        VALUES(@DiscordId, @Username, 0, 0, 0) 
        PRINT 'User registered for the first time'
    END

    -- ADD GUILD RELATIONSHIP --
    INSERT INTO DiscordGuildMember(UserId, GuildId, IsOwner)
    VALUES(@DiscordId, @GuildId, @IsOwner)

    PRINT 'Guild member added'
    RETURN 0

END