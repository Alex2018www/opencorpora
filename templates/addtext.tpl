{* Smarty *}
{include file='commonhtmlheader.tpl'}
<body>
<div id='main'>
{include file='header.tpl'}
<div id='content'>
    <h3>{t}Добавляем текст{/t}</h3>
    <form action="?act=check" method="post">
    {if isset($txt)}
            <textarea cols="70" rows="20" name="txt">{$txt}</textarea>
    {else}
            <textarea cols="70" rows="20" name="txt" onClick="this.innerHTML=''; this.onClick=''">Товарищ, помни! Абзацы разделяются двойным переводом строки, предложения &ndash; одинарным; предложение должно быть токенизировано.</textarea>
    {/if}
    <br/><br/>
    <input type="submit" value="{t}Проверить{/t}"/>
    </form>
</div>
<div id='rightcol'>
{include file='right.tpl'}
</div>
<div id='fake'></div>
</div>
{include file='footer.tpl'}
</body>
{include file='commonhtmlfooter.tpl'}