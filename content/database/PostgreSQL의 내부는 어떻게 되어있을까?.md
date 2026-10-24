---
title: How does PostgreSQL working inside?
date: 2026-09-15
tags:
  - domain/database
  - topic/postgresql
aliases: []
medium_url: ""
---

# How does PostgreSQL working inside? 1.

Write a complete opening paragraph that explains what this topic is, why it matters, and what the reader will learn.

데이터베이스가 어떤식으로 저장되고, 어떤식으로 사용하는지, 쿼리는 어떻게 작성하는지, 정규화는 왜 해야하는지 등은 학부에서 배웠고, 그래서 DB를 사용하는데 큰 문제는 없었다. 동작하게 하는 정도, 성능을 약간 좋게 하는 정도, 중복을 제거하는 방법과 성능과 중복 사이에서 환경에 맞춰 선택하는 방식 등을 하는덴 크게 문제가 없었다.

여태 '어떻게하면 취업되기 좋은 사람이 될 수 있을까?', '이 기술, 도구는 어떻게 사용하는가?', '이게 왜 필요한가?' 에 모든 관심을 쏟고, 그걸 이용해서 실제로 프로덕트를 만지고 결과를 낼 수 있느냐에 대한 고민만 해왔었고, 이것에 대해서 조금 현타아닌 현타가 온 것 같다.

정작 사람들과 네트워킹을 하면서 기술적인 깊은 대화를 하게되고, 나 스스로도 항상 호기심은 있었지만 귀찮고, 게으른 내 자신이 나중에 하겠지 하면서 미뤄왔던 단순한 질문이 있다. '이건 어떤식으로 동작하는거지?'

사실 구체적으로 깊이있게, 처음부터 어떤식으로 동작하는지를 알아야 하는, 왜 그렇게 되었는지 알아야하는 기술들도 있지만.. 내 생각에는 신입의 입장에서 많은 기술들이 그걸 모르고도 초기에 작업을 하는 과정에서는 큰 문제가 없다고 생각했고, 많은 사람들도 그렇게 느낄 것이라 생각했다. 이걸 몰라도 적당한 결과물이 나오고, 심각한 문제가 안 생기기 때문이다.

순전히 이런 '기술로서 어떤 식으로 동작하는지 처음부터 끝까지 이해' 하기위한 행위 자체가 너무 적어졌다는 생각이 많아졌고, 그리워서 항상 궁금했고 하고싶었던 DB들의 동작방식과, 특정 DB들의 차이 들을 좀 더 깊이 공부해보고자 했다.

이 과정에서 글을 AI가 작성하게 된다면, 유의미하지 않을 것이란 생각에 순전히 나의 언어로, 내가 이해하기 쉽게 이를 표현해보려한다.



내가 잊고 살았던 것은, 사실 PostgreSQL, Oracle, MySQL 등은 DB가 아닌 DBMS(DataBase Management System)이다. 뭐 표현은 그냥 DB라고 하지만, 배울 때 이렇게 나누는데엔 엄밀히 말하면 다르기 때문이겠지.

데이터를 저장하는 과정에서는 SQL Parser, Query Planner, Transaction Manager, Buffer Manager 등.. 정말 많은 것들이 유기적으로 모여서 돌아가지만, 사실 딱 저장만 놓고 봤을때는 이게 필요하지 않다. 어떤식으로 저장되는지, 어떻게 찾아야하는지, 이게 효율적으로 어떻게 관리가 되는지 가 DB의 관심사라면, DBMS는 '데이터가 안전한가', '데이터를 빠르게 접근하는가', '동시에 저장/검색/수정이 되는가'에 관심사가 몰려있다고 보면 된다. Transaction과 Recovery라던가, Query를 어떤 순서로 찾아야 가장 빠를지 결정하고, Query를 파싱하는 것 까지, 이런 것들이 우리가 아는 DBMS마다 다르게 구현된 것이라고 볼 수 있다. DBMS마다 다른 DB를 사용할 수도 있는 것이고.

애초에 '왜 DB라는게 필요하지? 그냥 파일로 저장하면 안되나? 메모장에다가 1. 이름, 날씨, 키, 나이 이런식으로 적어놓은 다음에 반복문으로 돌려서 찾으면 되지 않나?' 가 먼저 생각날테지만, 사실 금방 이해할 수 있다. 우리가 시간복잡도와 공간복잡도를 줄이는 이유는 한정된 컴퓨팅 리소스로 최상의 성능을, 최소한의 공간을 사용하기 위함이고 이것이 우리가 못하던 것들을 할 수 있게 해준다. 마찬가지로 파일단위로 저장해서도 할 수 있겠지만, 만약 1억줄 이상의 데이터가 들어왔다면, 이걸 순차탐색 한다고 생각하면 정말 오랜시간이 걸린다는 것을 알 수 있다.
뿐만 아니라, 만약 동시에 수정하는 동시성 문제가 생긴다면? 파일이 수정되고 작성되는 과정에서 서버가 작동을 멈춘다면? 이 모든걸 전부 해결하기위해 많은 개발자들이 노력한 결과가 DBMS, DB라고 보면 될 것 같다.

그럼 여기서 DB는 어떻게 데이터를 저장하는지부터 알아보자.







## Context

Describe the problem, prerequisites, and the situation in which this knowledge is useful.

## Core idea

Explain the concept in your own words. Define important terms before using them.

## Example

Provide a concrete example, command, diagram, or short code excerpt.

## Trade-offs and edge cases

Explain limitations, failure modes, operational concerns, and alternatives.

## What I learned

Summarize the durable insight rather than repeating the article.

## Connections

- [[content/area/related-post]]

## References

- [Authoritative reference](https://example.com)
