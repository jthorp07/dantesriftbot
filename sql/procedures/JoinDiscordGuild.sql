CREATE OR ALTER PROCEDURE JoinDiscordGuild (
    @GuildId CHAR(18),
    @GuildName VARCHAR(32)
) AS
BEGIN

    -- VALIDATE ARGS --
    IF (@GuildId) IS NULL OR (@GuildName) IS NULL BEGIN
        PRINT 'Args cannot be null'
        RETURN 1
    END

    IF  EXISTS (SELECT * FROM DiscordGuild WHERE DiscordId = @GuildId) BEGIN
        PRINT 'Guild already exists'
        RETURN 2
    END

    -- ADD GUILD --
    INSERT INTO DiscordGuild(DiscordId, GuildName)
    VALUES(@GuildId, @GuildName)
    RETURN 0

END