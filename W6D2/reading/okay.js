const $form = $("#cool-thing-form");
$form.on("submit", event => {
  event.preventDefault();

  const $input = $("#cool_thing");
  const coolThing = $input.val();
  $input.val("");

  const $li = $("<li></li>").text(coolThing);
  $li.on("mouseover", mouseoverCallback);
  $("ul.cool-things").append($li);
});

const $listItems = $("li");
$listItems.on("mouseover", mouseoverCallback);

mouseoverCallback = event => {
  const currentTarget = event.currentTarget;
  const $currentTarget = $(currentTarget);
  alert($currentTarget.text());
}
