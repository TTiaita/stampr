# Using the Project Management folder

## Summary

This document describes in very basic detail how the */Project Management* folder is intended to be used.

## Purpose

I am too lazy to bother setting up some other piece of software for Project Management, so I just did it in YAML files.

---

## /User Stories

### File name

The file name should be the Id attribute, followed by an underscore and then a brief CamelCase description.

### Id

This attribute should be the letters 'US', followed by a number.

### Name

The name of the User Story.

### Tags

Any tags that I think are useful.

### Description

A detailed description of the user story.

### Acceptance Criteria

A list of criteria which must be satisfied by the product in order for the User Story to be considered functioning correctly. These are what tests should be based on.

### Comments

A log of comments on the bug, including status transitions (ex. Todo -> In Progress -> Retesting -> Resolved)

---

## /Bugs

Bug files represent known issues in the product.

There have the following statuses:

- 0 Todo
- 1 In progress
- 2 Retesting
- 3 Resolved

### File name

The file name should be the Id attribute, followed by an underscore and then a brief CamelCase description.

### Id

This attribute should be the letters 'BG', followed by a number.

### Name

The full name of the defect.

### Tags

Any tags that I think are useful.

### Description

A description of the defect, including reproduction steps if possible.

### Comments

A log of comments on the bug, including status transitions (ex. Todo -> In Progress -> Retesting -> Resolved)

---

## Reporter

At some point I'll make a really basic command line reporter to show the number of items under each status, possibly with extra filtering (ignore Completed/Resolved, filter by tag, etc). But not yet.
