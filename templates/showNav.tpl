<nav>
    <ul class="categorie-list">
        {foreach from=$genres item=$genre }
            <li class="items-nav"><a href="categories/{$genre->id}">{$genre->genero}</a></li>
        {/foreach}
        {if isset($smarty.session.USER_ID)}
            <li class="items-nav"><a href="favorites"><span class="favoritos">💚</span></a></li>
        {/if}
    </ul>
</nav>