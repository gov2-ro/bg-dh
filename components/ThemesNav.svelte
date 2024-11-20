<script>
    import { buildQuery } from "@evidence-dev/component-utilities/buildQuery";
    let menuOpen = false;
    const qThemes = buildQuery("select * from Themes", "nonssr");   
    const qComponents = buildQuery("select * from Components", "nonssr");   
    const qIndicators = buildQuery("select * from Indicators", "nonssr");   

    function toggleMenuItem(event) {
        const item = event.currentTarget.parentNode;
        item.classList.toggle('open');
    }
</script>

<button class="menu-toggle" on:click={() => menuOpen = !menuOpen}>
    ☰ Menu
</button>

<nav>
    <ul class="menu {menuOpen ? 'open' : ''}">
        {#each qThemes as theme}
            <li class="menu-item">
                <a href="#" on:click|preventDefault={toggleMenuItem}>{theme.Name}</a>
                <ul class="dropdown">
                    {#each qComponents as component}
                        {#if component.Theme == theme.id}
                            <li class="dropdown-item">
                                <a href="#" on:click|preventDefault={toggleMenuItem}>{component.Name}</a>
                                <ul class="sub-dropdown">
                                    {#each qIndicators as indicator}
                                        {#if indicator.Component == component.id}
                                            <li><a href="/indicator/{indicator.id}">{indicator.Name}</a></li>
                                        {/if}
                                    {/each}
                                </ul>
                            </li>
                        {/if}
                    {/each}
                </ul>
            </li>
        {/each}
    </ul>
</nav>

<style>
    .menu-toggle {
        display: none;
    }

    /* Desktop styles */
    @media screen and (min-width: 769px) {
        nav {
            display: flex;
            justify-content: center;
        }
        .menu {
            list-style: none;
            display: flex;
            padding: 0;
            margin: 0;
        }
        .menu-item {
            position: relative;
            margin-right: 20px;
        }
        .menu-item > a {
            text-decoration: none;
            padding: 10px;
            display: block;
        }
        .dropdown,
        .sub-dropdown {
            display: none;
            position: absolute;
            list-style: none;
            padding: 0;
            margin: 0;
            background-color: #fff;
        }
        .menu-item:hover > .dropdown,
        .dropdown-item:hover > .sub-dropdown {
            display: block;
        }
        .dropdown-item {
            position: relative;
            background-color: #f9f9f9;
        }
        .dropdown-item > a {
            text-decoration: none;
            padding: 10px;
            display: block;
        }
    }
    
    ul.dropdown {z-index: 3;}
    ul.dropdown ul {z-index: 5;}
    ul.dropdown,
    ul.dropdown ul {z-index: 5; width: auto; max-width: 40em; margin-left: -5em; font-size: 15px; box-shadow: 1px 2px 3px rgba(0,0,0,.2); }
    ul.dropdown ul * {width: auto; max-width: 60em !important; }
    ul.dropdown li {
        line-height: 1.2;
        margin-bottom: .3ex;
        padding: .5ex .75ex;
     }
     ul.dropdown li:not(:last-child) {border-bottom: 1px solid #CCC;}
    ul.dropdown ul li:hover {background-color: #fCfCc0; }

    /* Mobile styles */
    @media screen and (max-width: 768px) {
        .menu-toggle {
            display: block;
            margin: 10px;
        }
        nav {
            display: block;
        }
        .menu {
            display: none;
            flex-direction: column;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .menu.open {
            display: flex;
        }
        .menu-item {
            margin-right: 0;
        }
        .menu-item > a,
        .dropdown-item > a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #000;
        }
        .dropdown,
        .sub-dropdown {
            display: none;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .menu-item.open > .dropdown,
        .dropdown-item.open > .sub-dropdown {
            display: block;
        }
        .menu-item > a::after,
        .dropdown-item > a::after {
            content: '+';
            float: right;
        }
        .menu-item.open > a::after,
        .dropdown-item.open > a::after {
            content: '-';
        }
        .menu-item > a {
            cursor: pointer;
        }
        .dropdown-item > a {
            cursor: pointer;
        }
    }
</style>
