{* Smarty *}
{if $bad_browser == 1}
<div id='pre_header'>Вы используете браузер Internet Explorer, который может некорректно отображать наш сайт. Рекомендуем поменять браузер.</div>
{/if}
<div id='header'>
<div id='lblock'><a href='{$web_prefix}/'>Home</a></div>
{strip}
<div id='rblock'>
{if $smarty.session.user_id}
    Вы &ndash; <b>{$smarty.session.user_name}</b>
    {if $smarty.session.user_group > 5}
        , администратор
        {if $smarty.session.debug_mode}
            &nbsp;[<a href='?debug=off'>debug off</a>]
        {else}
            &nbsp;[<a href='?debug=on'>debug on</a>]
        {/if}
        {if $smarty.session.user_group == 6}
            &nbsp;[<a href='?pretend=off'>перестать притворяться</a>]
        {else}
            &nbsp;[<a href='?pretend=on'>притвориться юзером</a>]
        {/if}
    {/if}
    &nbsp;[<a href='{$web_prefix}/login.php?act=logout'>выйти</a>]
{else}
    <a href='{$web_prefix}/login.php'>Вход/Регистрация</a>
{/if}
</div>
{/strip}
</div>
