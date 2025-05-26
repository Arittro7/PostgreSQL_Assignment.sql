# Bonus Section

# :dart:Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Primary Key হল একটি টেবিলের প্রতিটি সারিকে আলাদাভাবে শনাক্তকরন করার পদ্ধতি । Primary key নিশ্চিত করে যে একটি টেবিলের সকল রেকর্ড আলাদা এবং প্রতিটি সারি অন্যগুলোর থেকে আলাদা।

Foreign Key হল একটি টেবিলের একটি কলাম বা কলামের গ্রুপ যা অন্য একটি টেবিলের primary key-কে রেফার করে। Foreign key দুইটি টেবিলের মধ্যে সম্পর্ক তৈরি করতে ব্যবহৃত হয়।

ধরি আমাদের দুটি টেবিল আছে —
১. Course টেবিল
২. Mentor টেবিল
 
যেখানে Course টেবিলের মধ্যে রয়েছে  (course_id, course_name, duration, fees) এবং Mentor টেবিলে রয়েছে: (mentor_id, mentor_name)।
এখানে course_id এবং mentor_id উভয়ই তাদের নিজ নিজ টেবিলের Primary Key। যদি আমি Course টেবিল এবং Mentor টেবিলের মধ্যে সম্পর্ক স্থাপন করতে চাই, তাহলে Mentor টেবিলের mentor_id হবে Course টেবিলের একটি Foreign Key।

# :dart:Explain the purpose of the WHERE clause in a SELECT statement.

 একটি SELECT statement-এ WHERE clause ব্যবহৃত হয় নির্দিষ্ট শর্ত অনুযায়ী রেকর্ড ফিল্টার করতে, যাতে কেবল প্রয়োজনীয় রেকর্ডগুলোই ফিরিয়ে আনা হয়।

উদাহরণস্বরূপ: ধরা যাক আমাদের একটি Students টেবিল আছে যেখানে বিশ্বব্যাপী লক্ষ লক্ষ শিক্ষার্থীর তথ্যের রেকর্ড আছে। এখন আমরা কেবল **বাংলাদেশ** থেকে আসা শিক্ষার্থীদের তথ্য দেখতে চাই। এই ক্ষেত্রে WHERE clause ব্যবহার করা হবে।

```
SELECT * FROM students
WHERE country = 'Bangladesh';
```

# :dart:What are the LIMIT and OFFSET clauses used for?

LIMIT এবং OFFSET Clause উভয়ই ব্যবহৃত হয় কোয়েরি থেকে নির্দিষ্ট সংখ্যক সারি পাওয়ার জন্য। যেখানে LIMIT নির্ধারণ করে সর্বোচ্চ কতটি সারি ফেরত দেওয়া হবে এবং OFFSET নির্ধারণ করে কতটি সারি বাদ দিয়ে ফলাফল শুরু হবে।

**Example**
সেরা ১০ Product এর বিক্রয় জানতে
```
SELECT * FROM products LIMIT 10;
```
২১ - ৩০ নম্বরে থাকা Product এর লিস্ট পেতে
```
SELECT * FROM products LIMIT 10 OFFSET 30;
```

# :dart:How can you modify data using UPDATE statements?
কোনো টেবিলের বিদ্যমান রেকর্ড পরিবর্তন করতে UPDATE স্টেটমেন্ট ব্যবহার করা হয়। এটি নির্দিষ্ট সারির এক বা একাধিক কলামের মান পরিবর্তন করতে সহায়তা করে।
উদাহরণস্বরূপ:
একজন কর্মচারী যার employee_id 7, তাকে Senior Accountant পদে পদোন্নতি দেওয়া হয়েছে।
```
UPDATE employee
SET designation = 'Senior Accountant'
WHERE employee_id = 7;
```

# :dart:Explain the GROUP BY clause and its role in aggregation operations.

GROUP BY clause ব্যবহার করা হয় এক বা একাধিক সমান মানের সারিগুলোকে একত্রে একটি সারিতে গ্রুপ করতে। যখন কোনো Aggregate function (যেমন COUNT, SUM ইত্যাদি) প্রয়োগ করতে হয়, তখন GROUP BY clause অপরিহার্য হয় বিভিন্ন ক্যাটাগরির উপর সারাংশ রিপোর্ট তৈরির জন্য।

ধরা যাক আমাদের কাছে student নামে একটি টেবিলে student_id, name, country, marks নামে column অছে এখন আমরা চাই প্রতিটি দেশের শিক্ষার্থীদের মোট প্রাপ্ত নম্বর (marks) বের করতে।

````
SELECT country, SUM(marks) AS total_marks
FROM students
GROUP BY country;
````



