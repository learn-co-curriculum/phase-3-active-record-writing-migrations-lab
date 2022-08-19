# Writing Migrations

## Learning Goals

- Write your own migrations
- Run a migration to create a table
- Run a migration to add a column to a table
- Run a migration to change something in the table

## Instructions

In this lesson, you'll get practice writing migration code and creating new
migrations. Note that in order for the tests to work, the migrations must be
created with the file names as described below, using numbers instead of
timestamps.

Make sure to also follow proper naming conventions and use snake_case for the
file names, and PascalCase for the class names. The names must match **exactly**
in order for the migrations to work.

## Creating a Table

The first thing we will do is create a table. In
`db/migrate/01_create_students.rb`, write the code to create a table with Active
Record. We've created a class for you called `CreateStudents`.

Define a method called `change` and use the Active Record `create_table` method
within that method to create the table. The table should have a `:name` column
with a type `string`. Check the
[Active Record Migration docs][guide-migrations] for more help with the syntax.

After you finish defining the `change` method, run the migrations by running:

```console
$ bundle exec rake db:migrate
```

Check the status of your migration and verify the schema was updated correctly
to include a `students` table with a `name` column before proceeding.

## Adding a Column

The next thing we will do is add a couple of columns to the `students` table we
just created. To do this, we will create a second migration file. _We cannot add
these columns to the existing file._ Let's call our new file
`02_add_grade_and_birthdate_to_students.rb`. It should live in `db/migrate` just
like the first migration.

> **Note**: While we generally recommend using `rake db:create_migration` to create
> the migration files, for this lab you'll need to create the file name manually
> to ensure that the tests are able to find a file with the correct name.

This new migration will look similar to the previous one. We will need a class
that inherits from `ActiveRecord::Migration`, and we will need to define a
change method. Sticking to conventions, name the class
`AddGradeAndBirthdateToStudents`, since that is what we're doing (and that is
the camel case version of the _filename_, minus the numbers in front).

Inside `#change`, instead of `#create_table`, we will use the `#add_column`
Active Record method. It takes three necessary arguments:
`add_column(table_name, column_name, type)`. Check the
[Active Record Migration docs][guide-migrations] for more help with the syntax.

Let's add two columns. You'll need to call `#add_column` twice: once for each
column you're adding. Add a `grade` column that is an `integer`, and a
`birthdate` column that is a `string`.

After you finish defining the `change` method, run the migrations by running:

```console
$ bundle exec rake db:migrate
```

Check the status of your migration and verify the schema was updated correctly
before proceeding. The `students` table should now have `name`, `grade`, and
`birthdate` columns.

## Changing a Column

Imagine you're creating an incredible web app to send out a birthday greeting on
each student's birthday. While building this, you realize you accidentally
stored your `birthdate` data as a `string`. It would be much easier to work with
if the column type was `datetime` instead. Let's fix that.

Finally, we will **change** a column type, `string` to `datetime`. Same as
before, you'll have to _create another migration file_. This time call it
`03_change_datatype_for_birthdate.rb`. Once again, name the class the same name
as the file but with capital letters instead of underscores:
`ChangeDatatypeForBirthdate`.

This migration will have the same setup as the last. Write a `#change` method,
as usual. This time, in the `#change` method, be sure to use the
`#change_column` method. It takes three necessary arguments:
`change_column(table_name, column_name, type)`. Check the
[Active Record Migration docs][guide-migrations] for more help with the syntax.

After you finish defining the `#change` method, run the migrations by running:

```console
$ bundle exec rake db:migrate
```

Check the status of your migration and verify the schema was updated correctly
before proceeding. The data type for the `birthdate` should now be `datetime`.

## Resources

- [Active Record Migrations][guide-migrations]
- [Active Record Basics][active_record_basics]

[guide-migrations]: https://guides.rubyonrails.org/active_record_migrations.html
[active_record_basics]: http://guides.rubyonrails.org/active_record_basics.html
