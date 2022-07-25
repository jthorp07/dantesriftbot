CREATE OR ALTER PROCEDURE RemoveGuildMember(
    @MemberId CHAR(18),
    @GuildId CHAR(18)
) AS BEGIN

    -- VALIDATE ARGS --
    IF @MemberId IS NULL OR @GuildId IS NULL BEGIN
        PRINT 'Args cannot be null'
        RETURN 1
    END

    IF NOT EXISTS (SELECT * FROM DiscordGuildMember WHERE UserId = @MemberId AND GuildId = @GuildId) BEGIN
        PRINT 'No member to remove'
        RETURN 3
    END

    -- DELETE GUILD MEMBER --
    DELETE FROM DiscordGuildMember
    WHERE UserId = @MemberId
    AND GuildId = @GuildId

    PRINT 'Guild member removed'
    RETURN 0

END