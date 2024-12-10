---
title: You Control search
---

```sql ycsearch3
select * from ycsearch.ycsearch
```

<TextInput
    name=name_of_input
    title="Search"
    defaultValue="Aeroflot"
/>

<Checkbox title="People"  name=people defaultValue=true />
<Checkbox title="Companies"  name=companies defaultValue=true />

Selected Value: {inputs.name_of_checkbox}

Selected: {inputs.name_of_input}