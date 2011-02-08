{* Smarty *}
{include file='commonhtmlheader.tpl'}
<body>
<div id='main'>
{include file='english/header.tpl'}
<div id='content'>
<table border='1' cellspacing='0' cellpadding='3'>
{foreach from=$history item=h}
<tr{if $h.is_link} style='background:yellow'{/if}>
	<td>{$h.set_id}</td>
	<td>{$h.user_name|default:'Robot'}</td>
	<td>{$h.timestamp|date_format:"%a %d.%m.%Y, %H:%M"}</td>
	<td><a href="dict.php?act=edit&amp;id={$h.lemma_id}">{$h.lemma_text}</a></td>
	<td>
        {if $h.is_link}
        Links have changed
        {else}
        <a href="dict_diff.php?lemma_id={$h.lemma_id}&amp;set_id={$h.set_id}">Diff</a>
        {/if}
    </td>
    <td>{$h.comment|default:'(no comment)'}</td>
</tr>
{/foreach}
</table>
</div>
<div id='rightcol'>
{include file='english/right.tpl'}
</div>
<div id='fake'></div>
</div>
{include file='footer.tpl'}
</body>
{include file='commonhtmlfooter.tpl'}