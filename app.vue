<template>
  <header>
    <ul class="flex justify-center items-center bg-green-500 gap-4 h-[3rem]">
      <li>
        <NuxtLink
          to="/"
          class="text-white font-bold"
          exact-active-class="text-green-900 font-bold "
          >Home</NuxtLink
        >
      </li>
      <li>
        <NuxtLink
          to="/about"
          class="text-white font-bold"
          exact-active-class="text-green-900 font-bold "
          >About</NuxtLink
        >
      </li>
    </ul>
  </header>
  <NuxtPage />
</template>
