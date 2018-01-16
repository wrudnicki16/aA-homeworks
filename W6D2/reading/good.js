<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.js"></script>

<ul class="cool-things">
  <li>
    A cool thing
    <span>This gets moused over</span>
  </li>
</ul>

<script>
$("ul").on("mouseover", "li", event => {
  console.log(event.target);
  console.log(event.currentTarget);
  console.log(event.delegateTarget);
});
</script>
