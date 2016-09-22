alias BlogPhoenix.Repo
alias BlogPhoenix.Post

Repo.delete_all Post

# TODO: Warning mystery guests were invited to the house here in the form of an
# ID
# TODO: This is sign that mocking should get involved in the treatment of
# data...
Repo.insert! %Post{id: "05478f7b-2423-4698-983f-8c111a4fc85b", title: "the Narrative of The Man From Narangasett",
        body: "The winter falls were almost frozen. Moving slowly like the line
at the bakery next to the even more life retardant post office. It was a Tuesday
in February"}

Repo.insert! %Post{title: "life and Times of Weiner Stefanner",
body: "A curious little boy with a lop sided ear Weiner was always gregariously
in the way of his father who would have rather had another table that clealy
belonged to his pipe tobacco and accoutrements rather than this chubby little
grub whose ears made him seem as if he is hearing something that no one else
can. Matilde was impressed of course that she could pull off such an act of
angelic mischief and would make up stories about each of their neighbors when
Weiner's ear would point toward their town house in their tight little grouping
that surrounded if not the main but definitely the most picturesque square in
town."}

Repo.insert! %Post{title: "Walrus and the Yogurt",
        body: "http://www.walrusandtheyogurt.dmitri.co"}

